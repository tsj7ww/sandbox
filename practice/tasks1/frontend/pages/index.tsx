// pages/index.tsx
import { useState, useEffect } from 'react';
import {
  Container,
  Typography,
  Box,
  TextField,
  Button,
  Card,
  CardContent,
  List,
  ListItem,
  ListItemText,
} from '@mui/material';
import { styled } from '@mui/material/styles';

interface Task {
  id: number;
  title: string;
  description: string;
  created_at: string;
}

const StyledCard = styled(Card)`
  margin-bottom: 1rem;
  transition: transform 0.2s;
  &:hover {
    transform: translateY(-2px);
  }
`;

export default function Home() {
  const [tasks, setTasks] = useState<Task[]>([]);
  const [newTask, setNewTask] = useState({ title: '', description: '' });

  useEffect(() => {
    fetchTasks();
  }, []);

  // Use localhost for browser access
  const API_URL = 'http://localhost:8000';
  
  const fetchTasks = async () => {
    try {
      console.log('Fetching tasks from:', API_URL);
      
      // First try health check
      const healthResponse = await fetch(`${API_URL}/health`);
      const healthData = await healthResponse.json();
      console.log('Health check response:', healthData);
      
      // Then fetch tasks
      const response = await fetch(`${API_URL}/tasks/`);
      console.log('Response status:', response.status);
      console.log('Response headers:', Object.fromEntries([...response.headers]));
      
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      
      const data = await response.json();
      console.log('Received tasks:', data);
      setTasks(data);
    } catch (error) {
      console.error('Error fetching tasks:', error);
      if (error instanceof TypeError) {
        console.error('Network error details:', {
          message: error.message,
          name: error.name,
          stack: error.stack
        });
      }
    }
  };

  const handleCreateTask = async (e: React.FormEvent) => {
    e.preventDefault();
    console.log('Submitting task:', newTask);
    try {
      const response = await fetch(`${API_URL}/tasks/`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(newTask),
      });
      
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      
      console.log('Task created successfully');
      setNewTask({ title: '', description: '' });
      fetchTasks(); // Refresh the task list
    } catch (error) {
      console.error('Error creating task:', error);
    }
  };

  return (
    <Container className="py-8">
      <Typography variant="h4" component="h1" className="mb-6">
        Task Manager
      </Typography>

      <Box component="form" onSubmit={handleCreateTask} className="mb-8">
        <TextField
          fullWidth
          label="Task Title"
          value={newTask.title}
          onChange={(e) => setNewTask({ ...newTask, title: e.target.value })}
          className="mb-4"
        />
        <TextField
          fullWidth
          label="Description"
          multiline
          rows={3}
          value={newTask.description}
          onChange={(e) => setNewTask({ ...newTask, description: e.target.value })}
          className="mb-4"
        />
        <Button variant="contained" type="submit">
          Create Task
        </Button>
      </Box>

      <List>
        {tasks.map((task) => (
          <StyledCard key={task.id}>
            <CardContent>
              <Typography variant="h6">{task.title}</Typography>
              <Typography variant="body2" color="text.secondary">
                {task.description}
              </Typography>
              <Typography variant="caption" display="block" className="mt-2">
                Created: {new Date(task.created_at).toLocaleString()}
              </Typography>
            </CardContent>
          </StyledCard>
        ))}
      </List>
    </Container>
  );
}